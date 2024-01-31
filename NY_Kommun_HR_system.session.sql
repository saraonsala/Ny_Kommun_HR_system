SELECT
     e.ID,
    e.Name,
    e.Salary,
    e.Holiday_entitlement,
    ss.SSYcode_nr AS SSYcode,
    d.Department_name,
    s.Schema_nr,
    p.Pension_org_name,
    ss.Position,
    t.Union_name
FROM employees e
INNER JOIN ssycode ss ON e.SSYcode_ID = ss.ID
INNER JOIN department d ON e.Department_ID = d.ID
INNER JOIN schema_employees s ON e.Schema_employees_ID = s.ID
INNER JOIN pension_agreements p ON e.Pension_agreements_ID = p.ID
INNER JOIN trade_union_membership t ON e.Trade_union_Membership_ID = t.ID
ORDER BY d.Department_name ASC;

