# SQL Set Operators
---

Set Operators

intersect (&&) 
- Must contain only the same units from both sets

union (||)
- Conains all elements (non-duplicates) from both sets

except (!)
- Contains only units from one set.
---

Set A = {1,2,3,4,5}
Set B = {4,5,6,7,8}

Symmetric Difference = {1,2,3,6,7,8}

Symmetric Difference = (A Except B) Union (B Except A)

Symmetric Difference = (A union B) Except (A intersect B)