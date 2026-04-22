#include "textload.i"

sumb=0;
sumc=0;
func Handl( Amount, Price,fw,s) {
    
    extern sumb, sumc;
    int_amount = 0; 

    sread, Amount, int_amount; 
    
	double_Price=0.0;
	
	sread, Price, double_Price; 
    
    write,fw ,format="%.1f\n", int_amount * double_Price;
	
	 if (s == "buy") sumb+=(int_amount * double_Price);
	 else sumc+=(int_amount * double_Price);

}



func readfile(file,fw)
{
    extern sumb, sumc;
    f = open(file, "r");
	
    if (!f) return;
	
    while (1) {
        line = rdline(f);
		
        if (!line) break;
		
		words = [];
		
        remaining = line;
		
        while (remaining) {
		
            token = strtok(remaining);   
			// Splits first word from rest
            if (token(1)) grow, words, token(1);
			
            remaining = token(2);         // Move to next part of string
        }
		
		if (numberof(words)) 
		{
		  if (words(1) == "buy") {
		  
		    write,fw, "### BUY " + words(2)+ " ###";
		    Handl, words(3), words(4),fw,words(1);
			
          }else if (words(1) == "cell"){
		  
		     write,fw ,"$$$ CELL " + words(2) + " $$$";
		     Handl, words(3), words(4),fw,words(1);
		  }
		  
		}
		
    }
	write,fw ,format="TOTAL BUY: %.1f\n",sumb;
	write,fw ,format="TOTAL CELL: %.1f\n",sumc;
    close, f;
}

// --- Main Execution ---
write, "Please enter the full path to the project folder";
path = strtrim(rdline(stdin));
if (cd(path)) {
    
	fw=open("Tar0.asm","w")
	
    write, "Success! Folder exists.";
	
    all_files = lsdir(".");
	
    for(i=1; i<=numberof(all_files); i++) {
	
	    if(strpart(all_files(i), -2:0) == ".vm"){
		
           readfile, all_files(i),fw;
		}
    }
   
} else {

    write, "Directory not found.";
}
close, fw;