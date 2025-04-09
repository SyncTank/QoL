using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibDev
{
    struct AgentStats
    {
        int health;
        int armor;
        float speed;
        float attackspeed;
        float jump;
        float hover;
    }

    struct Ability
    {
        public int id;
        int cooldown;
        string description;
        string icon;
    }

    public struct Weapon
    {
        Ability[] Slots = new Ability[1];

        public Weapon()
        {
        }
    }

    struct HotBar
    {
        Ability[] slots = new Ability[3];
        Ability[] spells = new Ability[1];
        Ability[] consumable = new Ability;
        public HotBar() { }
    }

    internal class Agent
    {
        
        private AgentStats _stats;
        private List<Ability> _Posrelics;
        private List<Ability> _Negrelics;
        private Weapon _weapon;
        private HotBar _hotBar;


        public Agent(AgentStats stats)
        {
            this._stats = stats;
        }

    }
}
