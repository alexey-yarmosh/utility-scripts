def confirm():
  answer = ""
  while answer not in ["y", "n"]:
    answer = input("Continue? [Y/N] ").lower()
  return answer == "y"
