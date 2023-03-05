import { MyRequest } from "../interfaces/interfaces"
export const verifyAuthority = (req: MyRequest, ...allowedAuthorities) => {
        if (!req.headers.Authorization) return false;
        const rolesArray = [...allowedAuthorities];
        const authority = [req.authority];
        const result = rolesArray.map(role => authority.includes(role)).find(val => val === true);
        if (!result) return false;
        return true;
}
