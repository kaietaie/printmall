"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.verifyAuthority = void 0;
const verifyAuthority = (req, ...allowedAuthorities) => {
    if (!req.headers.Authorization)
        return false;
    const rolesArray = [...allowedAuthorities];
    const authority = [req.authority];
    const result = rolesArray.map(role => authority.includes(role)).find(val => val === true);
    if (!result)
        return false;
    return true;
};
exports.verifyAuthority = verifyAuthority;
//# sourceMappingURL=verifyAuthority.js.map