<protocol>

	<information> This protocol is a teaching tool for locating safety items in the laboratory. </information>
	<step>
		<description>Directions:</description>
		<note> In each step, you will be asked to find an item in the lab. A picture of the item and a map, with the item's location marked by a yellow dot, are provided. 
			Walk to the location the item, note the color of the dot that is on or near it, and then return to the computer to submit your answer.  
			\n\nYou will fail this protocol if you enter two or more incorrect answers.
		</note>
	</step>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>
	<assign><lhs>numberWrong</lhs><rhs>0</rhs></assign>
	
	
	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the sharps container? </description>
		<note> Its location is B15.215. \nPlease go to the sharps container, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the sharps container?</note>
		<image>Sharps_Container</image> 
		
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'green'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the sharps container which is used for the disposal of sharp items in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note> Please return to the sharps container and then answer again.</note>
				<image>Sharps_Container</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - sharps container'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the fire extinguisher located? </description>
		<note> Its location is B16.100. \nLocate the fire extinguisher, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the fire extinguisher?</note>
		<image>Fire_Extinguisher</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'blue'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the fire extinguisher which is used for putting out fires. </note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
 				<note>Please return to the fire extinguisher and then answer again.</note>
				<image>Fire_Extinguisher</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - fire extinguisher'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the shower and eyewash station? </description>
		<note> Its location is A3.515. \nPlease go to the shower and eyewash station, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the shower and eyewash station?</note>
		<image>shower-eyewash</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'yellow'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the shower and eyewash station which is used to cleanse your eyes or person in case you come in contact with hazardous chemicals or fire. </note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the shower and eyewash station and then answer again.</note>
				<image>shower-eyewash</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Shower and Eyewash'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the fume hood? </description>
		<note> Its location is A5.615. \nPlease go to the fume hood, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the fume hood?</note>
		<image>Fume_Hood</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'yellow'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the fume hood which is used limit exposure to hazardeous fumes.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the fume hood and then answer again.</note>
				<image>Fume_Hood</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Fume Hood'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the handwashing sink? </description>
		<note> Its location is B2.315. \nPlease go to the handwashing sink, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the handwashing sink?</note>
		<image>handwashingsink</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'purple'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the sink used for washing your hands.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the handwashing sink and then answer again.</note>
				<image>handwashingsink</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - handwashing sink'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where are the biohazard boxes? </description>
		<note> Their location is B15.400. \nPlease go to the biohazard boxes, note the color of the dot that is on or near them, and then return to the computer. 
		\n\nWhat color was the dot associated with the biohazard boxes?</note>
		<image>Biohazard_Box</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'blue'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located one of the biohazard boxes which are used for disposing of biohazardous materials.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the biohazard boxes and then answer again.</note>
				<image>Biohazard_Box</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Biohazard boxes'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>

		<description> Where is the dishwashing sink? </description>
		<note> Its location is A8.315. \nPlease go to the dishwashing sink, note the color of the dot that is on or near it, and then return to the computer. 
		\n\nWhat color was the dot associated with the dishwashing sink?</note>
		<image>dishwashingsink</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'green'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the sink which is used for washing dishes.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the dishwashing sink and then answer again.</note>
				<image>dishwashingsink</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Dishwashing sink'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where are the latex gloves? </description>
		<note> Their location is B14.320. \nPlease go to the latex gloves, note the color of the dot that is on or near them, and then return to the computer. 
		\n\nWhat color was the dot associated with the latex gloves?</note>
		<image>latexgloves</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'purple'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the latex gloves which are used protect your hands from hazardous substances in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the latex gloves and then answer again.</note>
				<image>latexgloves</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Latex Gloves'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where are the heat resistant gloves? </description>
		<note> Their location is B15.320. \nPlease go to the heat resistant gloves, note the color of the dot that is on or near them, and then return to the computer. 
		\n\nWhat color was the dot associated with the heat resistant gloves?</note>
		<image>Heat_Resistance_Gloves</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'yellow'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the heat resistant gloves which are used when handling hot objects in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the heat resistant gloves and then answer again.</note>
				<image>Heat_Resistance_Gloves</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Heat Resistant Gloves'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where are the paper towels? </description>
		<note> Their location is B15.520. \nPlease go to the paper towels, note the color of the dot that is on or near them, and then return to the computer. 
		\n\nWhat color was the dot associated with the paper towels?</note>
		<image>papertowels</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'blue'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the paper towels in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the paper towels and then answer again.</note>
				<image>papertowels</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - Paper Towels'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where are the goggles? </description>
		<note> Their location is B7.235. \nPlease go to the goggles, note the color of the dot that is on or near them, and then return to the computer. 
		\nThe goggles are in the drawer at the given location. 
		\n\nWhat color was the dot associated with the goggles?</note>
		<image>goggles</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'purple'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the goggles in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the goggles and then answer again.</note>
				<image>goggles</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - goggles'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>


   
	</if>
	</do>
	</while>

	<assign><lhs>task</lhs><rhs>0</rhs></assign>

	<while>
	<condition>%{task}==0</condition>
	<do>

	<step>
		<description> Where is the first aid kit? </description>
		<note> Its location is B7.500. \nPlease go to the first aid kit, note the color of the dot that is on or near them, and then return to the computer. 
		\n\nWhat color was the dot associated with the first aid kit? </note>
		<image>first_aid_kit_with_map</image>
		<select>
			<var>answer</var>
			<description>Please select the correct color</description>
			<choice>purple</choice>
			<choice>green</choice>
			<choice>yellow</choice>
			<choice>blue</choice>
		</select>
	</step>

	<if>

	<condition>%{answer} == 'green'</condition>

		<then>
			<assign><lhs>task</lhs><rhs>1</rhs></assign>
			<step>
				<description> That is correct! </description>
				<note> You have successfully located the first aid kit in the lab.</note>
			</step>

		</then>

		<else>
   
			<step>
				<description>That is incorrect.</description>
				<note>Please return to the first aid kit and then answer again.</note>
				<image>first_aid_kit_with_map</image>
			</step>
			<assign><lhs>numberWrong</lhs><rhs>%{numberWrong}+1</rhs></assign>
			<assign><lhs>Status</lhs><rhs>'Fail - first aid kit'</rhs></assign>
			<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>


   
	</if>
	</do>
	</while>

	<if> 
	<condition>%{numberWrong} > 1</condition>
		<then>
			<step>
				<description> You have failed this protocol. </description>
				<note> Your score is unsatisfactory. You will have to retake this protocol. </note>
			</step>
				<assign><lhs>Status</lhs><rhs>'Fail'</rhs></assign>
				<log><type>MESSAGE</type><data>%{Status}</data></log>
		</then>

		<else>

			<step> 
				<description> Congratulations! You have passed this protocol.</description>
				<note>You should now be able to find the items needed for recombinant DNA protocols. \n
				Your primers, phusion 2x Master Mix, and Gibson aliquot are located in the -20 degree freezer.</note>
			</step>
				<assign><lhs>Status</lhs><rhs>'Pass'</rhs></assign>
				<log><type>MESSAGE</type><data>%{Status}</data></log>
		</else>
	</if>
	
	
	<log><type>return</type><data>{ :numberWrong => %{numberWrong} }</data></log>
</protocol>
