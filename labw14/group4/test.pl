# test bed for trying ideas

# can dynamically extend hashs?
myhash = {}

x = "the hash is : " + myhash
step 
  description:" lets test a hash"
  note: "the has is : %{myhash}"
  end
  
  myhash = myhash + {1: "bye"}

step 
  description:" lets test a hash"
  note: "the hash is : %{myhash}"
  end
  
