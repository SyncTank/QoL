using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Channels;
using System.Threading.Tasks;

namespace LibDev
{
    class ChannelEvent
    {
        // Define an event
        public static event Func<Task> StartProcessing;

        public void Init()
        {
            // Create an unbounded channel
            var channel = Channel.CreateUnbounded<int>();

            // Subscribe to the event
            StartProcessing += async () =>
            {
                // Start the producer
                var producer = Task.Run(async () =>
                {
                    for (int i = 0; i <= 5; i++)
                    {
                        await channel.Writer.WriteAsync(i);
                        Console.WriteLine($"Produced: {i}");
                        await Task.Delay(500); // Simulate data generation
                    }
                    channel.Writer.Complete();
                });

                // Start the consumer
                var consumer = Task.Run(async () =>
                {
                    await foreach (var item in channel.Reader.ReadAllAsync())
                    {
                        // Simulate data processing
                        Console.WriteLine($"Consumed: {item}");
                        await Task.Delay(300); // Simulate processing time
                    }
                });

                // Wait for both producer and consumer to complete
                await Task.WhenAll(producer, consumer);
            };

            // Trigger the event to start processing
            StartProcessing?.Invoke().GetAwaiter().GetResult();

            // Wait for a key press to exit
            //Console.WriteLine("Press any key to exit...");
            //Console.ReadKey();
        }
    }
}
