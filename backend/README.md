
## di chuyển đến thư mục: cd backend
## chạy server: rails s

## Cách học là cứ không biết thì search google, AI cho ví dụ và hiểu nó


## JWT
### Cách hoạt động:
- Đăng nhập: Bạn gửi user/pass cho Server.

- Cấp thẻ: Server trả về 1 chuỗi JWT (đã được ký bảo mật).

- Sử dụng: Mỗi lần gọi API, bạn gửi kèm chuỗi này. Server kiểm tra chữ ký, nếu đúng thì cho phép truy cập.

- 3 Thành phần (ngăn cách bởi dấu .):
- Header: Loại token & thuật toán mã hóa.

- Payload: Thông tin người dùng (ID, tên, quyền hạn...).

- Signature: Chữ ký bảo mật (để đảm bảo không ai sửa được Payload).