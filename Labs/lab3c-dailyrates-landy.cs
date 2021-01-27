using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DailyRate
{
    class Program
    {
        static void Main(string[] args)
        {
            (new Program()).run();
        }

        void run()
        {
            double dailyRate = readDouble("Enter your daily rate: ");

            int noOfDays = readInt("Enter the number of days: ");

            writeFee(calculateFee(dailyRate, noOfDays));
        }

        private double calculateFee(double dailyRate, int noOfDays)
        {
            return dailyRate* noOfDays;
        }

        private void writeFee(double amount)
        {
            Console.WriteLine($"The consultant's fee is: {amount * 1.1}");
        }

        private int readInt(string prompt)
        {
            Console.Write(prompt);

            string line = Console.ReadLine();

            return int.Parse(line);
        }

        private double readDouble(string prompt)
        {
            Console.Write(prompt);

            string line = Console.ReadLine();

            double rv = double.Parse(line);
            return rv;
        }
    }
}
