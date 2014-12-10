#information "This protocol explains how to calculate the pipetting error rate."

class Protocol
<step>
  <description>Know the total volume.</description>
  <note>
  The total volume is the volume that the liquid SHOULD be after pipetting. If you just executed the large volume pipetting exercise,
  the total volume is 1000 µL. If you just executed the small volume pipetting exercise, the total volume is 10 µL.
  </note>
</step>

<step>
  <description>Draw up the liquid.</description>
  <note>
  If the total volume is 10 µL, make sure you have centrifuged all the the liquid to the bottom of the tube. Using the correct pipette that is set to the total volume, draw up as much liquid from the tube as 
  possible. There are three possible outcomes after this step. Pick which outcome best applies.
  </note>
    <select>
      <description>Outcome possibilities:</description>
        <var>outcome</var>
          <choice>There is still liquid left in the tube.</choice>
          <choice>There is not more liquid left in the tube, but there is air at the bottom of the
          pipette tip.</choice>
          <choice>There is no more liquid left in the tube, and there is no air at the bottom of the 
          pipette tip.</choice>
    </select>
</step>

<if>
  <condition>%{outcome} == "There is still liquid left in the tube."</condition>
      <then>
        <step>
          <description>Too much liquid was pipetted.</description>
          <note>
          Dispose of the tip with liquid in it add a fresh tip and pipette up the remaining liquid, then slowly  
          rotate the volume dial to decrease the volume until the liquid reaches the bottom of the tip. This volume 
          is the new volume.
          </note>
        </step>
        <step>
          <description>Calculate the error.</description>
          <note>The error rate is (new volume / total volume).</note>
        </step>
      </then>
</if>

<if>
  <condition>%{outcome} == "There is not more liquid left in the tube, but there is air at the bottom of the pipette tip."</condition>
    <then>
      <step>
        <description>Too little liquid was pipetted.</description>
        <note>
        Slowly rotate the volume dial to decrease the volume until the liquid reaches the bottom of the tip. This
        volume is the new volume.
        </note>
      </step>
      <step>
        <description>Calculate the error.</description>
        <note>
        The error rate is (total volume - new volume) / total volume.
        </note>
      </step>
    </then>
</if>

<if>
  <condition>%{outcome} == "There is no more liquid left in the tube, and there is no air at the bottom of the pipette tip."</condition>
    <then>
      <step>
        <description>Congratulations!</description>
        <note>
        The error rate is 0.
        </note>
      </step>
    </then>
</if>
    
<step>
  <description>Write down the error rate.</description>
  <note>
  Repeat this protocol for every tube of liquid.
  </note>
</step>


</protocol>
