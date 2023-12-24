module eg();
  
  	bit [4:0] x;					    
  	bit [2:0] y;						


	covergroup cg;
			
      option.per_instance = 1;
      
      option.name = "Cover_X_Y";
      
      
      option.at_least = 2;
      
      Y : coverpoint y{
        
       // option.goal = 70;
        
        option.weight = 2;
        
        ignore_bins b1 = {2};
      }
      X : coverpoint x {
        
        //option.goal = 70;
        
        //ignore_bins b2 = {0, 3, 5, 7};
        
        //illegal_bins b3 ={2, 4};
        
        option.weight = 3;
        
        option.auto_bin_max = 64;  
      }

	endgroup: cg
  
  

	initial begin: B1
		
		cg c = new();	

      repeat(50) begin: B2
			
        {x,y} = $urandom();
        $display("x: %0d and y: %0d", x, y);
			c.sample();				// calling sampling method	
		end: B2
		

	end: B1
  
    
	initial begin: B3
		
		#500;
		$stop();					
    end
endmodule: eg


