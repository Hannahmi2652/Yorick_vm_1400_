//cd ,"C:/Hannahmi2652/Yorick_vm_1400_/Tar2"
//include "exe2.i"
//C:/Hannahmi2652/Yorick_vm_1400_\nand2tetris/projects/8/ProgramFlow/BasicLoop


//LABEL
func Label(label,f_asm)
{
   write,f_asm,format="//label %s\n",label;
   write,f_asm,format="(%s)\n\n",label;
}