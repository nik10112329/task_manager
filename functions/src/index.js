"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.notifyTaskAssignment = void 0;
const functions = require("firebase-functions/v1");
const admin = require("firebase-admin");
admin.initializeApp();
exports.notifyTaskAssignment = functions.firestore
    .document("tasks/{taskId}")
    .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    if (!before || !after)
        return null;
    if (after.assignedTo && after.assignedTo !== before.assignedTo) {
        const taskId = context.params.taskId;
        const taskTitle = after.title || "Новая задача";
        const tokensSnap = await admin
            .firestore()
            .collection("users")
            .doc(after.assignedTo)
            .collection("fcmTokens")
            .get();
        const tokens = tokensSnap.docs
            .map((doc) => doc.data().token)
            .filter((token) => Boolean(token));
        if (tokens.length === 0) {
            console.log("Токенов нет, уведомления не отправляются");
            return null;
        }
        // Сообщение (для локальной отладки логируем вместо отправки)
        const message = {
            notification: {
                title: "У вас новая задача!",
                body: taskTitle,
            },
            data: {
                type: "task_assigned",
                taskId: taskId,
            },
            tokens,
        };
        try {
            if (process.env.FUNCTIONS_EMULATOR) {
                // Логируем сообщение вместо отправки push
                console.log("Эмулятор: уведомление для токенов", tokens);
                console.log("Сообщение:", message);
            }
            else {
                // Если на проде, отправляем реальное уведомление
                const response = await admin.messaging().sendEachForMulticast(message);
                console.log(`Успешно: ${response.successCount}, ошибок: ${response.failureCount}`);
            }
        }
        catch (error) {
            console.error("Ошибка:", error);
        }
    }
    return null;
});
