using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSM
{
    public interface IState
    {
        void Execute();
        void Enter(string player);
        void Exit();
    }

    public class IdleState : IState
    {
        public void Execute()
        {

        }

        public void Enter(string player)
        {

        }

        public void Exit()
        {

        }
    }

    public class WalkState : IState
    {
        public void Execute()
        {

        }

        public void Enter(string player)
        {

        }

        public void Exit()
        {

        }
    }

    public class RunState : IState
    {
        public void Execute()
        {

        }

        public void Enter(string player)
        {

        }

        public void Exit()
        {

        }
    }

    class CSM
    {
        private IState _currentState;
        private Stack<IState> _states;
        
        // Optionally define static states for comptime check
        //static RunState Running;

        public CSM()
        {
            _currentState = new IdleState();
            _states = new Stack<IState>();
            _states.Push(_currentState);
        }

        public void ProcessInput(string input)
        {
            if (input == "Walk")
            {
                _currentState = new WalkState();
                _states.Push(_currentState);
                Console.WriteLine("Transitioning to Processing state.");
            }

            if (input == "Run")
            {
                _currentState = new RunState();
                _states.Push(_currentState);
                Console.WriteLine("Transitioning to End state.");
            }
        }


        public IState GetCurrentState()
        {
            return _currentState;
        }
    }
}
