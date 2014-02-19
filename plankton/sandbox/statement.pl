function f()
  step
    description: "A Step Inside f"
  end
end

f()

y = f() || true

step
  description: "y = %{y}"
end
