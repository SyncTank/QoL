using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSM
{
    public enum State
    {
        Start,
        Processing,
        End
    }

    public class FiniteStateMachine
    {
        private State _currentState;

        public FiniteStateMachine()
        {
            _currentState = State.Start;
        }

        public void ProcessInput(string input)
        {
            switch (_currentState)
            {
                case State.Start:
                    if (input == "begin")
                    {
                        _currentState = State.Processing;
                        Console.WriteLine("Transitioning to Processing state.");
                    }
                    break;

                case State.Processing:
                    if (input == "process")
                    {
                        _currentState = State.End;
                        Console.WriteLine("Transitioning to End state.");
                    }
                    break;

                case State.End:
                    Console.WriteLine("FSM is in the End state.");
                    break;
            }
        }

        public State GetCurrentState()
        {
            return _currentState;
        }
    }

}
