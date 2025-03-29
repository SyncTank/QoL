using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibDev
{
    public enum States
    {
        IDLE,
        RUN,
        ACTION,
        JUMP
    }

    internal interface IState
    {
        void Execute();

    }



}
