# test bed for trying ideas

# can dynamically extend hashs?
myhash = {}


step 
  description:" lets test a hash"
  note: "the hash is : %{myhash}"
  end
  
myhash = {myhash, 1: "foo"}

step 
  description:" lets test a hash"
  note: "the hash is : %{myhash}"
  end
  
