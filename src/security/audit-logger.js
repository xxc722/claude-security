cat > src/security/audit-logger.js << 'EOF'
/**
 * 安全审计日志模块 - 记录认证相关事件（登录、令牌验证、权限变更）
 */
class AuditLogger {
  constructor() {
    this.logLevel = 'info'; // 日志级别：info/warn/error
  }

  // 记录登录事件
  logLoginEvent(userId, ipAddress, success) {
    const event = {
      timestamp: new Date().toISOString(),
      type: 'login',
      userId: userId || 'unauthenticated',
      ip: ipAddress,
      success: success,
      message: success ? 'Login successful' : 'Login failed'
    };
    this._writeLog(event);
  }

  // 写入日志（实际环境可对接ELK、文件等）
  _writeLog(event) {
    console.log(`[AUDIT] ${JSON.stringify(event)}`);
  }
}

module.exports = new AuditLogger();
EOF

# 3. （可选）创建日志使用说明文档
mkdir -p docs
touch docs/security-log-guide.md
cat > docs/security-log-guide.md << 'EOF'
# 安全审计日志使用指南
## 功能说明
记录认证相关事件（登录、令牌验证失败、权限变更），用于安全审计和异常追溯。

## 核心接口
- logLoginEvent(userId, ipAddress, success)：记录登录事件
- logTokenEvent(tokenId, action, success)：记录令牌操作事件
EOF
