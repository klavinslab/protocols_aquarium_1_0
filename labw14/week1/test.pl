step
  description: "What is your favorite number? Pick 1 if you want to live."
  getdata
    numberWrong: number, "The number"
  end
end

log 
  return: { numberWrong: numberWrong }
end
