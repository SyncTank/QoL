using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibDev
{
    class BT
    {
        // Base Node class
        public abstract class Node
        {
            public abstract bool Execute();
        }

        // Composite Node class
        public abstract class CompositeNode : Node
        {
            protected List<Node> children = new List<Node>();

            public void AddChild(Node child)
            {
                children.Add(child);
            }
        }

        // Selector Node (OR logic)
        public class Selector : CompositeNode
        {
            public override bool Execute()
            {
                foreach (var child in children)
                {
                    if (child.Execute())
                    {
                        return true;
                    }
                }
                return false;
            }
        }

        // Sequence Node (AND logic)
        public class Sequence : CompositeNode
        {
            public override bool Execute()
            {
                foreach (var child in children)
                {
                    if (!child.Execute())
                    {
                        return false;
                    }
                }
                return true;
            }
        }

        // Action Node
        public class ActionNode : Node
        {
            private Func<bool> action;

            public ActionNode(Func<bool> action)
            {
                this.action = action;
            }

            public override bool Execute()
            {
                return action();
            }
        }

        // Condition Node
        public class ConditionNode : Node
        {
            private Func<bool> condition;

            public ConditionNode(Func<bool> condition)
            {
                this.condition = condition;
            }

            public override bool Execute()
            {
                return condition();
            }
        }
    }
}
