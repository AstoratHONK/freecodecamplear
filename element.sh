#! /bin/bash

P="psql -X -U freecodecamp -d periodic_table --tuples-only -c"
if [[ -z $1 ]]
	then
	echo "Please provide an element as an argument."
else
	UNIT_TABLE=$($P "SELECT properties.atomic_number, elements.symbol, properties.type_id, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, elements.name FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id")
	echo "$UNIT_TABLE" | while IFS=" | " read  ATOM_NUM SYMBOL TYPE MASS MELTA BOIL NAME
									     do
		     							 #continue;
											 if [[ $1 == $ATOM_NUM ]]
											 then
													UNIT_TABLE1=$($P "SELECT properties.atomic_number, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, elements.name FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number = $1")
													echo "$UNIT_TABLE1" | while IFS=" | " read  ATOM_NUM1 SYMBOL1 TYPE1 MASS1 MELTA1 BOIL1 NAME1
																								do
																								#echo "$UNIT_TABLE1"
																								echo "The element with atomic number $ATOM_NUM1 is $NAME1 ($SYMBOL1). It's a $TYPE1, with a mass of $MASS1 amu. $NAME1 has a melting point of $MELTA1 celsius and a boiling point of $BOIL1 celsius."
		  																					done
													elif [[ $1 == $SYMBOL ]]
													then
														UNIT_TABLE2=$($P "SELECT properties.atomic_number, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, elements.name FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.symbol = '$1'")
														echo "$UNIT_TABLE2" | while IFS=" | " read  ATOM_NUM2 SYMBOL2 TYPE2 MASS2 MELTA2 BOIL2 NAME2
																									do
																									#echo "$UNIT_TABLE1"
																									echo "The element with atomic number $ATOM_NUM2 is $NAME2 ($SYMBOL2). It's a $TYPE2, with a mass of $MASS2 amu. $NAME2 has a melting point of $MELTA2 celsius and a boiling point of $BOIL2 celsius."
		    																					done
														elif [[ $1 == $NAME ]]
														then
															UNIT_TABLE3=$($P "SELECT properties.atomic_number, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, elements.name FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.name = '$1'")
															echo "$UNIT_TABLE3" | while IFS=" | " read  ATOM_NUM3 SYMBOL3 TYPE3 MASS3 MELTA3 BOIL3 NAME3
																										do
																										#echo "$UNIT_TABLE1"
																										echo "The element with atomic number $ATOM_NUM3 is $NAME ($SYMBOL3). It's a $TYPE3, with a mass of $MASS3 amu. $NAME3 has a melting point of $MELTA3 celsius and a boiling point of $BOIL3 celsius."
		    																						done							
											 fi
											 done

	UNIT_TABLE4=$($P "SELECT properties.atomic_number, elements.symbol, properties.type_id, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, elements.name FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE CAST(properties.atomic_number AS CHAR) = '$1' OR elements.symbol = '$1' OR elements.name = '$1'")
  if [[ -z $UNIT_TABLE4 ]]
	then
		echo "I could not find that element in the database."
	fi
fi

#sfgsdgsadg
#sdgds
# AAAAAAAAAAAAAAAAsdfsdfsdAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

