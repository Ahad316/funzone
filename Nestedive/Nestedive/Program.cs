Console.WriteLine("Enter Your First Number");
int n1= int.Parse(Console.ReadLine());
Console.WriteLine("Enter Your Second Number");
int n2 = int.Parse(Console.ReadLine());
Console.WriteLine("Enter Your Third Number");
int n3 = int.Parse(Console.ReadLine());
if(n1 > n2 && n1 > n3)
{
    Console.WriteLine("n1 is greater than n2,n3:" + n1);
}
if (n2 > n1 && n2 > n3)
{
    Console.WriteLine("n2 is greater than n1,n3:" + n2);
}
else
{
    Console.WriteLine("n3 is greater than n1,n2:" + n3);
}


