using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace LibDev
{
    public class Node3D
    {
        Quaternion rotation;
        Vector3 position;
    }

    public class Entity : Node3D
    {
        public string mesh = "lol";
        private string _state;
        private string _behavior;
        private string _name;
    } 

    public class Monkey : Node3D 
    { 
        public required string Name { get; set; }
    }

    public class EntityPool<T>
    {
        private List<T> items = [];

        public void Add(T item)
        {
            items.Add(item);
        }

        public T Get(int index)
        {
            return items[index];
        }

        public void Remove()
        {
            var hold = items.Last();
            items.Remove(items.Last());
            items.Add(items[0]);
            items[0] = hold;
        }

        public int size()
        {
            return items.Count;
        }

    }

    public class GenericEntity<T>
    {
        private T data;

        public GenericEntity(T value)
        {
            data = value;
        }

        public T GetData()
        {
            return data;
        }

        public void SetData(T value)
        {
            data = value;
        }
    }

}
