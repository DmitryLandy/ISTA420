using System;

namespace quiz1
{
	class Program
	{
		/*
		Has two parts. Part 1 outputs MSSA into the command prompt using WriteLine() methods.
		Part 2 calculates the value of phi and outputs it.
		*/
		static void Main(string[] args)
		{
			Console.WriteLine("This is C Sharp quiz 1.");
			Console.WriteLine("Part 1");

			Console.WriteLine("MM        MM  SSSSSSSS  SSSSSSSS     AAAAAA   ");
			Console.WriteLine("MMM      MMM  SSSSSSSS  SSSSSSSS     AA  AA   ");
			Console.WriteLine("MMMM    MMMM  SS        SS          AA    AA  ");
			Console.WriteLine("MM MM  MM MM  SS        SS          AA    AA  ");
			Console.WriteLine("MM  MMMM  MM  SSSSSSSS  SSSSSSSS   AAAAAAAAAA ");
			Console.WriteLine("MM   MM   MM  SSSSSSSS  SSSSSSSS   AAAAAAAAAA ");
			Console.WriteLine("MM        MM        SS        SS  AA        AA");
			Console.WriteLine("MM        MM        SS        SS  AA        AA");
			Console.WriteLine("MM        MM  SSSSSSSS  SSSSSSSS  AA        AA");
			Console.WriteLine("MM        MM  SSSSSSSS  SSSSSSSS  AA        AA");

			Console.WriteLine();
			Console.WriteLine();

			//start part 2
			Console.WriteLine("Part 2");

			double phi;

			phi = (1 + (Math.Sqrt(5))) / 2;

			Console.WriteLine($"phi is {phi}");			
			Console.WriteLine("Press any key to continue...");


		} //end Main method
	} // end class Program
}  //end namespace block
