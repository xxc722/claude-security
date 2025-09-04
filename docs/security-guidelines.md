#Workflow specification for security vulnerability repair

## 1. Branch naming conventions
-Emergency security fix: ` hotfix/[vulnerability type] - [version]`
-Example: ` hotfix/uth-bypass-v2.1.3 '`
-Regular security update: ` security/[ve id] - [brief description]`

## 2. Required content for safety work order
-The vulnerability title must include the severity level and CVE number
-Must include the affected version range
-CVSS score and risk assessment must be provided
-Must include a preliminary repair plan

## 3. Key points of safety PR review
-Does the code follow the principle of minimum privilege
-Is the authentication/authorization logic complete
-Have necessary security tests been added
-Have the relevant documents been updated
-Are there any potential side effects

## 4. Security testing requirements
-Must include unit test coverage repair code
-Must be analyzed through SAST static code analysis
-High risk vulnerabilities must undergo penetration testing verification
-Must verify that the fix does not introduce new vulnerabilities
