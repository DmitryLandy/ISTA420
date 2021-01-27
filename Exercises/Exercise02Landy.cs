/*
 * Name: Dmitry Landy
 * File: Exercise02-landy.cs
 * Date: 23 January 2021
 */
using System;

namespace progex02
{
    class Program
    {
        //Main method executes the methods to the 4 parts of the exercise: 
        //sum of 10 numbers, average of 10 numbers, average of N numbers
        //average of unknown amount of numbers
        static void Main(string[] args)
        {
            warmup();
            part1();
            part2();
            part3();
            part4();            
        }

        private static void warmup()
        {
            int start = 0, end = 2, sum = 0;
            Console.WriteLine("This is the Warm-up for Quiz 02\n");
            Console.WriteLine(GetSum(start, end, sum));
        }

        
        private static void part1()
        {            
            Console.WriteLine("\n\nPart 1, sum of 10 numbers.");
            double sum = SumTen(0, 0);
            Console.WriteLine($"The sum of the 10 integers is {sum}");
        }

        private static void part2()
        {            
            Console.WriteLine("\nPart 2, average 10 numbers.");
            double avg = AvgTen(0, 0);
            char letterGrade = NumToLetter(avg);
            Console.WriteLine($"The average of the 10 integers is {avg} and the letter grade is {letterGrade}");
        }

        private static void part3()
        {
            Console.WriteLine("\nPart 3, average user predetermined number of scores.");
            Console.WriteLine("how many scores do you wish to enter?");
            int numOfScores = int.Parse(Console.ReadLine());
            double avg = AvgUnk(0, 0, numOfScores);
            char letterGrade = NumToLetter(avg);
            Console.WriteLine($"The average of {numOfScores} integers is {avg} and the" +
                $" letter grade is {letterGrade}");
        }

        private static void part4()
        {
            Console.WriteLine("\nPart 4, average non-predetermined number of scores.");
            (double avg, int scores) = AnyAvg(0, 0);
            char letterGrade = NumToLetter(avg);
            Console.WriteLine($"The average of {scores} integers is {avg} and the " +
                $"letter grade is {letterGrade}");
        }

        //Below are the methods called by the partX methods
        //==================================================

        private static (double, int) AnyAvg(double sum, int counter)
        {

            Console.Write("Enter a score (-1 to quit): ");
            double currentValue = double.Parse(Console.ReadLine());

            if (currentValue == -1)
                return (sum / counter, counter);    

            sum += currentValue;
            ++counter;

            return AnyAvg(sum, counter);
        }

        private static double AvgUnk(double sum, int counter, int numOfScores)
        {
            if (counter == numOfScores)
                return sum / numOfScores;

            Console.Write("Enter a score: ");
            sum += double.Parse(Console.ReadLine());
            ++counter;

            return AvgUnk(sum, counter, numOfScores);
        }        

        //Recursive method that adds the value of start to the sum 
        //each iteration until start equals end
        private static double GetSum(int start, int end, double sum)
        {
            Console.WriteLine($"get_sum({start}, {end}, {sum})");
            if (start == end)
                return sum;
            else
                return GetSum(++start, end, sum += start);
        }

        private static double AvgTen(double sum, int counter)
        {
            if (counter == 10)
                return sum/counter;

            Console.Write("Enter a score: ");
            sum += Double.Parse(Console.ReadLine());
            ++counter;

            return AvgTen(sum , counter);
        }

        private static double SumTen(double sum, int counter)
        {
            if (counter ==  10)
                return sum;

            Console.Write("Enter a score: ");
            sum += Double.Parse(Console.ReadLine());

            return SumTen(sum, ++counter);
        }

        //This method returns the letter grade equivilant of the grade parameter
        private static char NumToLetter(double grade)
        {
            if (grade >= 90)
                return 'A';
            else if (grade >= 80)
                return 'B';
            else if (grade >= 70)
                return 'C';
            else if (grade >= 60)
                return 'D';
            else
                return 'F';
        }


    }
}
