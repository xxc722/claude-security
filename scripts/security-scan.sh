#!/bin/bash
# 安全漏洞修复验证扫描脚本
# 用于检查修复分支的安全合规性

set -e

# 配置
SCAN_DIR="./src"
REPORT_FILE="security-scan-report.txt"
EXCLUDE_PATTERNS="vendor,node_modules"

echo "=== 开始安全扫描 ==="
echo "扫描目录: $SCAN_DIR"
echo "报告文件: $REPORT_FILE"

# 检查敏感信息泄露
echo -e "\n[1/4] 检查硬编码密钥..."
grep -r -E '(API_KEY|SECRET|PASSWORD|TOKEN)[[:space:]]*=[[:space:]]*["'\''][A-Za-z0-9]+["'\'']' $SCAN_DIR --exclude-dir={$EXCLUDE_PATTERNS} > $REPORT_FILE

# 检查JWT相关安全问题
echo -e "\n[2/4] 检查JWT实现..."
grep -r -E 'jwt\.verify\([^,]+,[^,]+,?[^)]*\)' $SCAN_DIR --exclude-dir={$EXCLUDE_PATTERNS} >> $REPORT_FILE

# 检查安全头部配置
echo -e "\n[3/4] 检查安全头部..."
grep -r -E '(X-Content-Type-Options|X-Frame-Options|Content-Security-Policy)' $SCAN_DIR --exclude-dir={$EXCLUDE_PATTERNS} >> $REPORT_FILE

# 检查权限控制
echo -e "\n[4/4] 检查权限验证..."
grep -r -E 'checkPermission|hasRole|isAuthenticated' $SCAN_DIR --exclude-dir={$EXCLUDE_PATTERNS} >> $REPORT_FILE

echo -e "\n=== 扫描完成 ==="
echo "结果已保存到 $REPORT_FILE"
echo "请查看报告确认安全修复是否完整"
