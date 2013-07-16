Taq PCR
-----------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Description: Amplify a segment of DNA from a DNA or RNA template using the high-fidelity Taq polymerase

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
####Total duration: 1.5-3.5 hours
####Total worktime: 30 minutes 
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

####Required equipment and materials####

    * Thermal cycler that holds 0.2mL tubes
        + Duration needed: init_time + cycles*cycle_time + final_extension_time
       
----------------

    * 0.2mL Thin Wall Strip Well Tubes 
        + Quantity: 1 
    * Molecular Grade Water
        + Quantity: 19e-6 liters 
    * Template DNA, 1ng/µL
        + Quantity: 1µL
    * Primer, 10µM
        + Quantity: 2.5µL
    * Primer, 10µM
        + Quantity: 2.5µL
    * Taq 2X Master Mix
        + Quantity: 25µL
       
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

##Protocol##

1. Get out all materials and place on bench.
2. Label a 0.2mL strip well tube with initials, date, and unique identifier.
3. Pipet 19µL molecular grade water into the strip well tube.
4. Pipet 1µL of template DNA into the strip well tube.
5. For each primer, pipet 2.5µL into the strip well tube.
6. Pipet 25µL of Taq 2X Master mix into the strip well tube.
7. Place strip well tube into thermal cycler.
8. Program the thermal cycler with the following settings:
* 98C 5min
* 35 cycles of
    * 98C 10s
    * %{taq_anneal}C 15s
    * 72C %{template_len / 1000.0 * 60}s
* 72C 5min
9. Launch the thermal cycler with these settings.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
####Additional Information and Settings####

taq_anneal:
* Should be approximately the Tm calculated for the primer on the NEB website (SantaLucia98 params + Owczarzy04 salt corrections).

####Common Issues####

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       
For questions, contact Nick Bolten at nbolten@gmail.com
