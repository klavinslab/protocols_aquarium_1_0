step
  getdata
    x: string, "A string"
    y: number, "A number"
  end
end

log
  return: { x: [ 1, { name: x }], y: y }
end
