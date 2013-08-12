Counting colonies with openCFU
--------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Description:

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Total duration: 7 minutes per plate ####
####Total worktime: 7 minutes per plate

    - Day 1: 7 minutes per plate
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####Required equipment and materials####

Day 1

    * Gel station
        + Duration needed: 1 min per plate
        + Location: Gel bay
    * Windows computer with openCFU 3.8.8
        + Duration needed: 5 min per plate
        + Location: Plate reader (or elsewhere)
  
------

    * CFU plate
        + Quantity: 1+
        + Location: Incubator or fridge

Day 2

    * [Equipment 1]
        + Duration needed: [x days/hours/min]
        + Location: [address]
    * [Equipment 2]
        + Duration needed: [x days/hours/min]
        + Location: [address]
        
---------

        
    * [Item 1]
        + Quantity: [x ml/mg/items]
        + Location: [address]
    * [Item 2]
        + Quantity: [x ml/mg/items]
        + Location: [address]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Example image:
<img src="https://dl.dropbox.com/s/1ovun5fuxpgx6mi/openCFU.png" style="width: 600px;"/>

##Protocol##

*Note: this protocol assumes you ran Leandra's low-error CFU plating [protocol](https://github.com/klavinslab/protocols/blob/master/assays/assay_quality_CFU_plating_best_practices.md)!

###### Day 1

1. Image plates with the following camera settings:
	* Manual mode (M)
	* ISO: 80
	* Macro mode (flower)
	* White balance: tungsten
	* Exposure: 2.5 seconds
	* Focus on plate rim
	
2. Copy all image files to appropriate folder
3. Start openCFU software. 
4. Note colonies automatically counted for each plate with the following settings
	* Threshold: **Inverted**, **10** to **20**
	* Radius: **3** to **5** (depends on how long cells have incubated)
	* Color filter: not required
	* Outlier filter: not required
5. Count colonies along plate edge not captured by software.
6. Subtract any false positives (usually only when radius is set to **3** or lower)
7. Record colony count and dilution factor on appropriate spreadsheet.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    
####Additional Information and Settings####

    [Parameter/variable/clarification/option 1]:
        [Option 1]:
        [Option 2]:
    [Parameter/variable/clarification/option 2]:
        [Option 1]:
        [Option 2]:

####Common Issues####

    Poor image using plates from fridge:
        - Let sit out for 20 minutes to wipe condensation.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       
For questions, contact Rob Egbert at robegbert@gmail.com    
