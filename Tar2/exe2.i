//cd ,"C:/Hannahmi2652/Yorick_vm_1400_/Tar2"
//include "exe2.i"
//C:/Hannahmi2652/Yorick_vm_1400_/nand2tetris/projects/8/ProgramFlow/BasicLoop
//C:/Hannahmi2652/Yorick_vm_1400_/nand2tetris/projects/8/ProgramFlow/FibonacciSeries


//LABEL
func Label(label,f_asm)
{
   write,f_asm,format="//label %s\n",label;
   write,f_asm,format="(%s)\n\n",label;
}


//Goto
func Goto(label,f_asm)
{
   write,f_asm,format="//Goto %s\n",label;
   write,f_asm,"@label";
   write,f_asm,"0;JMP\n";

}

//If-goto

func if_goto(label,f_asm)
{
   write,f_asm,format="//if-goto %s\n",label;
   write,f_asm,"@SP";
   write,f_asm,"AM=M-1";
   write,f_asm,"D=M";
   write,f_asm,format=" @%s\n",label;
   write,f_asm,"D;JGT\n";
} 
