# test bed for trying ideas

# can dynamically extend hashs?
myhash = "hi"

x = "the hash is : " + myhash
step 
  description:" lets test a hash"
  note: "%{x+myhash}"
  end
  

step 
  description:" lets test a hash"
  note: "the hash is : %{myhash}"
  end
  
