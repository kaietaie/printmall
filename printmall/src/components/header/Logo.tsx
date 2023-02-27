import {ReactComponent as AppLogo} from "../images/logo.svg";

const Logo = () => {
  return (
    <div className="logo">
      <AppLogo/>
      <span className="logo-text">
        PrintMall
      </span>
    </div>
  )
}

export default Logo