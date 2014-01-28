step
  description: "What is your favorite number?"
  getdata
    n: number, "The number"
  end
end

log 
  return: { n: n, m: 2*n }
end
