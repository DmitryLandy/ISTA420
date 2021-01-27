using System;

namespace TestHello
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("What is your name?");
            String name = Console.ReadLine();
            Console.WriteLine($"Hello {name}");
            
        } //end Main method
    } // end class Program
}  //end namespace block
