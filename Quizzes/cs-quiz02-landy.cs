/*
 * Name: Dmitry Landy
 * File: cs-quiz1-landy.cs
 * Date: January 22, 2021
 */
using System;

namespace Quiz02
{
    class Program
    {
        static void Main(string[] args)
        {
            int start = 1, next = 1, counter = 0, target = 40;
            Console.WriteLine("C Sharp Quiz 2");
            Console.WriteLine("Calculating phi using a recursive method by the Fibonacci series");
            Console.WriteLine($"Calling fibonachi({start},{next},{counter},{target}");
            Console.WriteLine($"The number phi is equal to {fibonacci(start, next, counter, target)}");
        }

        private static double fibonacci(int first, int next, int counter, int target)
        {
            if (counter == target)
            {
                return (double)next /(double)first;
            }
                
            else
            {
                if (counter == target)
                    return (double)next / (double)start;
                else
                    return fibonacci(next, next += start, ++counter, target);
            }
                
        }
    }
}
