using LibDev;
using System;
using UtilAI;
using Google.Protobuf;
using static LibDev.BT;

namespace Core
{
    class Program
    {
        static void Main(string[] args)
        {

            // Creating a generic object to store an integer
            GenericEntity<int> intObject = new GenericEntity<int>(42);
            Console.WriteLine(intObject.GetData()); // Output: 42

            EntityPool<GenericEntity> enList = new EntityPool<GenericEntity>();

        }

        void testCallers()
        {
            // Create a new AddressBook
            var addressBook = new AddressBook();

            // Add a Person to the AddressBook
            var person = new Person
            {
                Name = "John Doe",
                Id = 1234,
                Email = "johndoe@example.com"
            };
            addressBook.People.Add(person);

            // Serialize the AddressBook to a binary file
            using (var output = File.Create("addressbook.bin"))
            {
                addressBook.WriteTo(output);
            }

            // Deserialize the binary file back to an AddressBook
            AddressBook newAddressBook;
            using (var input = File.OpenRead("addressbook.bin"))
            {
                newAddressBook = AddressBook.Parser.ParseFrom(input);
            }

            // Print the deserialized data
            foreach (var p in newAddressBook.People)
            {
                Console.WriteLine($"Name: {p.Name}, ID: {p.Id}, Email: {p.Email}");
            }



            FSM.FiniteStateMachine fsm = new();

            Console.WriteLine("Current State: " + fsm.GetCurrentState());
            fsm.ProcessInput("begin");
            Console.WriteLine("Current State: " + fsm.GetCurrentState());
            fsm.ProcessInput("process");
            Console.WriteLine("Current State: " + fsm.GetCurrentState());



            ChannelEvent channelEvent = new();
            channelEvent.Init();

            /*
            Node: The base class for all nodes in the behavior tree.
            CompositeNode: An abstract class for nodes that can have children (e.g., Selector, Sequence).
            Selector: Executes its children until one succeeds (OR logic).
            Sequence: Executes its children until one fails (AND logic).
            ActionNode: A leaf node that performs an action.
            ConditionNode: A leaf node that checks a condition.
             */

            // Create behavior tree
            Selector root = new Selector();

            Sequence sequence = new Sequence();
            sequence.AddChild(new ConditionNode(() => true)); // Condition always true
            sequence.AddChild(new ActionNode(() => { Console.WriteLine("Action 1 executed"); return true; }));

            root.AddChild(sequence);
            root.AddChild(new ActionNode(() => { Console.WriteLine("Action 2 executed"); return true; }));

            // Execute behavior tree
            root.Execute();

            UtilAI.NPC npc = new NPC
            {
                Health = 40,
                EnemyDistance = 15
            };

            npc.DecideAction(); // Output: "NPC seeks cover!"
        }

    }


}