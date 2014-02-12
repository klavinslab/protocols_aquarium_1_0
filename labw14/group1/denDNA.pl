step
  description: "This protocal provides the procedure to denature the extracted DNA library"
end

step
  description: "Select the approximate concentraton of your DNA library"
  getdata
    C: string, "", ["4nM or greater", "approx 2nM"]
  end
  
end

if length(C) == 14
        conc = 0;
elsif length(C) == 10
        conc = 1;
else
     step
       description: "Something mysterious has heppened.  You entered an unexpected library concentration"
       note: "This protocol will assume a low (<<4nM) concentration"
     end
end

step
 description: "test"
  
end
