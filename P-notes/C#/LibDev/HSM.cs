using CSM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HSM
{
    public class IState
    {
        public virtual void Execute()
        {

        }
        public virtual void Enter(string player)
        {

        }
        public virtual void Exit()
        {


        }
    }

    public class onGround : IState
    {
        public override void Enter(string player)
        {

        }
    }

    public class Walk : onGround
    {
        public override void Enter(string player)
        {

        }

        public override void Exit()
        {
            base.Exit();
        }
    }

    class HSM
    {
        private IState _currentState;
        private Stack<IState> _states;

        // Optionally define static states for comptime check
        //static RunState Running;

        public HSM()
        {
            _currentState = new Walk();
            _states = new Stack<IState>();
            _states.Push(_currentState);
        }

        public void ProcessInput(string input)
        {
            if (input == "Walk")
            {
                _currentState = new Walk();
                _states.Push(_currentState);
                Console.WriteLine("Transitioning to Processing state.");
            }
        }


        public IState GetCurrentState()
        {
            return _currentState;
        }
    }
}
