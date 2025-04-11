"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiResponse = void 0;
const common_1 = require("@nestjs/common");
class ApiResponse {
    constructor(success, statusCode, message, data, errors) {
        this.success = success;
        this.statusCode = statusCode;
        this.message = message;
        this.data = data || null;
        this.errors = errors;
    }
    static success(data, message = 'Operation successful', statusCode = common_1.HttpStatus.OK) {
        return new ApiResponse(true, statusCode, message, data);
    }
    static error(message, errors, statusCode = common_1.HttpStatus.BAD_REQUEST) {
        return new ApiResponse(false, statusCode, message, null, errors);
    }
}
exports.ApiResponse = ApiResponse;
//# sourceMappingURL=api-response.js.map