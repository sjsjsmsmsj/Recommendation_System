import { useState } from "react";
import { login } from "../services/authService";
import logo from "../assets/logo.png";
import { useNavigate } from "react-router-dom";


export default function Login() {
    const naviage = useNavigate();
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");

    const handleSubmit = async (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        setError("");

        try {
            const res = await login(email, password);
            localStorage.setItem("token", res.token);
            alert("Đăng nhập thành công");
            // redirect sau
            // window.location.href = "/dashboard";
        } catch (err) {
            setError("Email hoặc mật khẩu không đúng");
        }
    };

    return (
        <div className="login-page">
            {/* LEFT */}
            <div className="login-left">
                <img
                    src={logo}
                    alt="logo"
                    className="logo"
                />
                <h2>
                    Recommendation System giúp bạn học tập và giải trí
                    và trò chuyện với mọi người.
                </h2>
            </div>

            {/* RIGHT */}
            <div className="login-right">
                <form className="login-box" onSubmit={handleSubmit}>
                    <input
                        type="text"
                        placeholder="Email hoặc số điện thoại"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                    />

                    <input
                        type="password"
                        placeholder="Mật khẩu"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                    />

                    {error && <p className="error">{error}</p>}

                    <button className="btn-signup">Đăng ký</button>

                    <p
                        className="forgot"
                        onClick={() => naviage("/")}

                    >Đã có tài khoản?</p>

                </form>
            </div>
        </div>
    );
}
