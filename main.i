//C:/Hannahmi2652/Yorick_vm_1400_/main/main.i
include, "Tar2/exe2.i"
include, "Tar1/exe1.i"


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
		 else if(token(1)== "sub")Sub,f_asm;
		 else if(token(1)== "neg")neg,f_asm;
		 else if(token(1)== "eq"||token(1)== "lt"||token(1)== "gt") IF,token(1),f_asm;
		 else if(token(1)== "not"||token(1)== "and"||token(1)== "or") BIT,token(1),f_asm;
		 else if(token(1)== "label")Label, token(2), f_asm;
		 else if(token(1)== "goto")Goto, token(2), f_asm;
		 else if(token(1)== "if-goto") if_goto, token(2), f_asm;
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

