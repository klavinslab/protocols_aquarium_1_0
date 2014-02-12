# test bed for trying ideas

# can dynamically extend hashs?
myhash = {}

step 
  description:" lets test a hash"
  note: "the has is : %{myhash}"
  end
  
  myhash = myhash + { x: "bye"}

step 
  description:" lets test a hash"
  note: "the hash is : %{myhash}"
  end
  
