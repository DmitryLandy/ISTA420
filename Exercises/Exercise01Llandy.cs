//Name: Dmitry Landy

using System;

namespace progex01
{
    class Program
    {
        static void Main(string[] args)
        {   
            //Part 1: Circumference and area of a circle
            Console.WriteLine("\nPart 1. circumference and area of a circle.");
            Console.Write("Enter an integer for the radius: ");
            string radiusInput = Console.ReadLine();
            int intRadius = int.Parse(radiusInput);
            double circumference = 2 * (Math.PI) * intRadius;
            double area = (Math.PI) * (intRadius * intRadius);

            Console.WriteLine($"The circumference is {circumference}");
            Console.WriteLine($"The area is {area}");

            //Part 2: Volume of a hemisphere
            Console.WriteLine("\nPart 2, volume of a hemisphere.");
            Console.Write("Enter an integer for the radius: ");
            radiusInput = Console.ReadLine();
            intRadius = int.Parse(radiusInput);
            double volume = ((4 / 3) * (Math.PI) * (intRadius * intRadius * intRadius)) / 2;
            Console.WriteLine($"The volume is {volume})");

            //Part 3: Area of a triangle
            String strVarA, strVarB, strVarC; //holds the input            
            int varA, varB, varC; //holds num of converted string input           

            double varP; //calculate p
            double triangleArea; //calculate triangle area
            
            Console.WriteLine("\nPart 3, area of a triangle (Heron's formula).");
            Console.Write("Enter an integer for side A: ");           
            strVarA = Console.ReadLine();
            varA = int.Parse(strVarA);

            Console.Write("Enter an interger for side B: ");
            strVarB = Console.ReadLine();
            varB= int.Parse(strVarB);

            Console.Write("Enter an interger for side C: ");
            strVarC = Console.ReadLine();
            varC = int.Parse(strVarC);

            varP = (varA + varB + varC) / 2; //calculate p
            triangleArea = Math.Sqrt(varP * (varP - varA) * (varP - varB) * (varP - varC));

            Console.WriteLine($"The area is {triangleArea})");

            //Part 4: Solving the Quadratic Equation
            Console.WriteLine("\nPart 4, solving a quadratic equation.");
            Console.Write("Enter an integer for A: ");
            strVarA = Console.ReadLine();
            varA = int.Parse(strVarA);

            Console.Write("Enter an interger for B: ");
            strVarB = Console.ReadLine();
            varB = int.Parse(strVarB);

            Console.Write("Enter an interger for C: ");
            strVarC = Console.ReadLine();
            varC = int.Parse(strVarC);

            double numPos = (-varB + (Math.Sqrt((varB * varB) - (4 * varA * varC))));
            double numNeg = (-varB - (Math.Sqrt((varB * varB) - (4 * varA * varC))));
            double denom = 2 * varA;

            Console.WriteLine($"The positive solution is {numPos / denom}");
            Console.WriteLine($"The negative solution is {numNeg / denom}");




        }
    }
}
