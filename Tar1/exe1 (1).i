//cd ,"C:/Yorick_exe/Tar1"
//C:/Yorick_exe/nand2tetris/projects/7/MemoryAccess/BasicTest
//include,"exe1.i"
//C:/Yorick_exe/nand2tetris/projects/7/StackArithmetic/SimpleAdd
//"C:/Yorick_exe/nand2tetris/projects/7/MemoryAccess/PointerTest"
//"C:/Yorick_exe/nand2tetris/projects/7/MemoryAccess/StaticTest"
//"C:/Yorick_exe/nand2tetris/projects/7/StackArithmetic/StackTest"

eq_val=1;
lt_val=1;
gt_val=1;


//PUSH
func Push(segment,i,f_asm,name_file)
{
 i_int = 0; 
 sread, i, i_int; 

 write,f_asm,format="%s%s %s\n","//push ",segment,i;
 
 if(segment=="static")
 {
    write ,f_asm,format=" @%s%s\n",strpart(name_file, 1:-2),i;
	write ,f_asm,"D=M";
	
 }

 else if(segment=="pointer")
 {
    if(i=="0") write ,f_asm,"@THIS";
	else if(i=="1") write ,f_asm,"@THAT";
	write ,f_asm,"D=M";
 }

 else if(segment=="constant")
 {
   write, f_asm, format=" @%s\n", i;
   write ,f_asm,"D=A";
 }

 else if(segment=="temp")  
 {
   i_int=i_int+5;
   write,f_asm ,format=" @%d\n",i_int;
   write ,f_asm,"D=M";
 }

 else 
 {
   if(segment=="local") write,f_asm ,"@LCL";
   else if(segment=="that")  write,f_asm ,"@THAT";
   else if(segment=="argument")  write,f_asm ,"@ARG";
   else if(segment=="this")  write,f_asm ,"@THIS";
   write ,f_asm,"A=M"; 
   
   for(j=1;j<=i_int;j++)
   {
      write,f_asm,"A=A+1";
   }

   write ,f_asm,"D=M";  
 }
 
 write ,f_asm,"@SP";
 write ,f_asm,"A=M";
 write ,f_asm,"M=D";
 write,f_asm,"@SP";
 write ,f_asm,"M=M+1\n";
  
}

//POP

func Pop(segment,i,f_asm,name_file)
{
  i_int = 0; 
  sread, i, i_int; 

  write,f_asm,format="%s%s %s\n","//pop ",segment,i;

  write ,f_asm,"@SP";
  write ,f_asm,"A=M-1";
  write ,f_asm,"D=M";
  
   if(segment=="static")
 {
    write ,f_asm,format=" @%s%s\n",strpart(name_file, 1:-2),i;
	write ,f_asm,"M=D";
 }

  else if(segment=="pointer")
  {
    if(i=="0") write ,f_asm,"@THIS";
	else if(i=="1") write ,f_asm,"@THAT";
	write ,f_asm,"M=D";
  }
  
  else if(segment=="temp")  
  {
    i_int=i_int+5;
    write,f_asm ,format=" @%d\n",i_int;
    write ,f_asm,"M=D";
  }
  
  else
  {

   if(segment=="local") write ,f_asm,"@LCL";
   else if(segment=="that")  write,f_asm ,"@THAT";
   else if(segment=="argument")  write,f_asm ,"@ARG";
   else if(segment=="this")  write,f_asm ,"@THIS";

   write ,f_asm,"A=M";
   for(j=1;j<=i_int;j++)
   {
      write,f_asm,"A=A+1";
   }
   write ,f_asm,"M=D";
  }
  
  write ,f_asm,"@SP";
  write ,f_asm,"M=M-1\n";

}

//ADD

func Add(f_asm)
{
  write,f_asm,"//add";
  write ,f_asm,"@SP";
  write ,f_asm,"A=M-1";
  write ,f_asm,"D=M";
  write,f_asm,"A=A-1";
  write ,f_asm,"M=D+M";
  write ,f_asm,"@SP";
  write ,f_asm,"M=M-1\n";

}
//SUB

func Sub
{
  write,f_asm,"//sub";
  write ,f_asm,"@SP";
  write ,f_asm,"A=M-1";
  write ,f_asm,"D=M";
  write,f_asm,"A=A-1";
  write ,f_asm,"M=M-D";
  write ,f_asm,"@SP";
  write ,f_asm,"M=M-1\n";
}

//IF(EQ,LT,GT)

func IF(segment)
{
  extern eq_val,lt_val,gt_val;

  write,f_asm,format="//%s\n",segment;

  write ,f_asm,"@SP";
  write ,f_asm,"A=M-1";
  write ,f_asm,"D=M";
  write,f_asm,"A=A-1";
  write ,f_asm,"D=M-D";
  
  if(segment=="eq")
  {
  write ,f_asm,format=" @EQ_IF_TRUE_%d\n",eq_val;
  write ,f_asm,"D;JEQ";
  write ,f_asm,"D=0"
  write ,f_asm,format=" @EQ_CONTINUE_%d\n",eq_val;
  write ,f_asm,"0;JMP";
  write ,f_asm,format=" (EQ_IF_TRUE_%d)\n",eq_val;
  write ,f_asm,"D=-1"
  write ,f_asm,format=" (EQ_CONTINUE_%d)\n",eq_val;
  eq_val++;
  }
  else if(segment=="lt")
  {
  write ,f_asm,format=" @LT_IF_TRUE_%d\n",lt_val;
  write ,f_asm,"D;JLT";
  write ,f_asm,"D=0"
  write ,f_asm,format=" @LT_CONTINUE_%d\n",lt_val;
  write ,f_asm,"0;JMP";
  write ,f_asm,format=" (LT_IF_TRUE_%d)\n",lt_val;
  write ,f_asm,"D=-1"
  write ,f_asm,format=" (LT_CONTINUE_%d)\n",lt_val;
  lt_val++;
  }
  else if(segment=="gt")
  {
  write ,f_asm,format=" @GT_IF_TRUE_%d\n",gt_val;
  write ,f_asm,"D;JGT";
  write ,f_asm,"D=0"
  write ,f_asm,format=" @GT_CONTINUE_%d\n",gt_val;
  write ,f_asm,"0;JMP";
  write ,f_asm,format=" (GT_IF_TRUE_%d)\n",gt_val;
  write ,f_asm,"D=-1"
  write ,f_asm,format=" (GT_CONTINUE_%d)\n",gt_val;
  gt_val++;
  }
  

  write ,f_asm,"@SP";
  write ,f_asm,"M=M-1";
  write ,f_asm,"A=M-1";
  write ,f_asm,"M=D\n";

}

//NEG

func neg
{
  write ,f_asm,"@SP";
  write ,f_asm,"A=M-1";
  write ,f_asm,"M=-M\n";
}

//BIT

func BIT(segment)
{
   write ,f_asm,"@SP";
   write ,f_asm,"A=M-1";
   if(segment=="not") 
   {
   write ,f_asm,"M=!M\n";
   return;
   }
   write ,f_asm,"D=M";
   write ,f_asm,"A=A-1";
  
   if(segment=="and") write ,f_asm,"M=M&D";
   else if(segment=="or") write ,f_asm,"M=M|D";
   
   write ,f_asm,"@SP";
   write ,f_asm,"M=M-1\n";
}

func readfile(fvm,f_asm)
{
  
//we open the file
    f_vm = open(fvm, "r");
    if (!f_vm) return;
	
	while (1) {
	
        line = rdline(f_vm);
        if (!line) break;
		
		remaining = line;
		token = strtok(remaining); 
		if (token(1)  ) 
		{
		 if(token(1)== "push")
		 {
		    remaining=token(2);
			token = strtok(remaining); 
		    Push ,token(1),token(2),f_asm,fvm;
		 }
		 else if(token(1)== "pop")
		 {
		    remaining=token(2);
			token = strtok(remaining);
            Pop ,token(1),token(2),f_asm,fvm;			
		 }
		 else if(token(1)== "add")Add,f_asm;
		 else if(token(1)== "sub")Sub;
		 else if(token(1)== "neg")neg;
		 else if(token(1)== "eq"||token(1)== "lt"||token(1)== "gt") IF,token(1);
		 else if(token(1)== "not"||token(1)== "and"||token(1)== "or") BIT,token(1);
		}
		
		   
    }
	
close, f_vm;
	
}












// --- Main Execution ---


write, "Please enter the full path to the project folder";
path = strtrim(rdline(stdin));
if (cd(path)) {
    
	
	
    write, "Success! Folder exists.";
	
    all_files = lsdir(".");
	
    for(i=1; i<=numberof(all_files); i++) {
	
	
	    if(strpart(all_files(i), -2:0) == ".vm"){
		
		//here i build the asm file
		   file_name=strpart(all_files(i),1:-3)
		   file_asm_name=swrite(format="%s%s",file_name,".asm");
		   file_asm=open(file_asm_name,"w")
		
		//now we will read the file
		   readfile, all_files(i),file_asm;
		
		}
    }
   
} else {

    write, "Directory not found.";
}
write,file_asm,"(END)";
write,file_asm,"@END"
write,file_asm,"0;JMP"
close, file_asm;


