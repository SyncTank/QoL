using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UtilAI;

namespace UtilEv
{
    public interface IAction
    {
        float CalculateUtility(NPC npc);
        void Execute(NPC npc);
    }

    public class AttackAction : IAction
    {
        public float CalculateUtility(NPC npc)
        {
            // Example utility calculation based on health and enemy proximity
            return npc.Health > 50 && npc.EnemyDistance < 10 ? 0.8f : 0.2f;
        }

        public void Execute(NPC npc)
        {
            Console.WriteLine("NPC attacks the enemy!");
        }
    }

    public class FleeAction : IAction
    {
        public float CalculateUtility(NPC npc)
        {
            // Example utility calculation based on health and enemy proximity
            return npc.Health < 30 && npc.EnemyDistance < 10 ? 0.9f : 0.1f;
        }

        public void Execute(NPC npc)
        {
            Console.WriteLine("NPC flees from the enemy!");
        }
    }

    public class SeekCoverAction : IAction
    {
        public float CalculateUtility(NPC npc)
        {
            // Example utility calculation based on enemy proximity
            return npc.EnemyDistance < 20 ? 0.7f : 0.3f;
        }

        public void Execute(NPC npc)
        {
            Console.WriteLine("NPC seeks cover!");
        }
    }

    public class HealAction : IAction
    {
        public float CalculateUtility(NPC npc)
        {
            // Example utility calculation based on health
            return npc.Health < 50 ? 0.6f : 0.2f;
        }

        public void Execute(NPC npc)
        {
            Console.WriteLine("NPC heals!");
        }
    }

    public class NPC
    {
        public float Health { get; set; }
        public float EnemyDistance { get; set; }
        private IAction bestAction = new AttackAction();

        public void SetBestAction(IAction action)
        {
            bestAction = action;
        }

        public void ExecuteBestAction()
        {
            bestAction?.Execute(this);
        }
    }

    public class UtilityEvaluator
    {
        private List<IAction> actions;

        public UtilityEvaluator()
        {
            actions = new List<IAction>
        {
            new AttackAction(),
            new FleeAction(),
            new SeekCoverAction(),
            new HealAction()
        };
        }

        public void EvaluateAndServeActions(List<NPC> npcs)
        {
            Parallel.ForEach(npcs, npc =>
            {
                IAction bestAction = EvaluateBestAction(npc);
                npc.SetBestAction(bestAction);
            });
        }


        private IAction EvaluateBestAction(NPC npc)
        {
            IAction? bestAction = null;
            float highestUtility = float.MinValue;

            foreach (var action in actions)
            {
                float utility = action.CalculateUtility(npc);
                if (utility > highestUtility)
                {
                    highestUtility = utility;
                    bestAction = action;
                }
            }

            return bestAction;
        }
    }

    public class GameManager
    {
        private List<NPC> activeNPCs;
        private UtilityEvaluator utilityEvaluator;

        public GameManager()
        {
            activeNPCs = new List<NPC>();
            utilityEvaluator = new UtilityEvaluator();
        }

        public void AddNPC(NPC npc)
        {
            activeNPCs.Add(npc);
        }

        public void Update()
        {
            utilityEvaluator.EvaluateAndServeActions(activeNPCs);

            foreach (var npc in activeNPCs)
            {
                npc.ExecuteBestAction();
            }
        }
    }

}
