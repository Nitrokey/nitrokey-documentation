find . -name "*.rst" | while read i; do 
	sed -i -e 's/`__/`_/g' $i					
done
