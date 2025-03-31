using LibDev;
using System;
using static LibDev.BT;

namespace Core
{
    class Program
    {
        static void Main(string[] args)
        {
            FiniteStateMachine fsm = new();

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

        }
    }


}