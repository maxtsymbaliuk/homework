#!/usr/bin/env bash

# Перевіряємо, чи встановлені змінні середовища для сесії
if [[ -n "$AWS_ACCESS_KEY_ID" && -n "$AWS_SECRET_ACCESS_KEY" && -n "$AWS_SESSION_TOKEN" ]]; then
    echo "An active AWS CLI session has been detected."
    echo "1 -  end this session and start a new one"
    echo "2 - end this session"
    read -p "Enter your choise:: " RESPONSE
    case $RESPONSE in
        1)
            unset AWS_ACCESS_KEY_ID
            unset AWS_SECRET_ACCESS_KEY
            unset AWS_SESSION_TOKEN
            echo "The active session is now closed. Enter the MFA code from your device and press Enter:"
            ;;
        2)
            unset AWS_ACCESS_KEY_ID
            unset AWS_SECRET_ACCESS_KEY
            unset AWS_SESSION_TOKEN
            echo "The active session was over."
            exit 0
            ;;
        *)
            echo "WHAT???: $RESPONSE"
            exit 1
            ;;
    esac
fi

# Запитуємо MFA код для створення нової сесії
read -p "Введіть MFA код з Вашого пристрою та натисніть Enter:" MFA_CODE
MFA_SERIAL_NUMBER="arn:aws:iam::590184137042:mfa/maxtsymbaliuk"
OUTPUT=$(aws sts get-session-token --serial-number $MFA_SERIAL_NUMBER --token-code $MFA_CODE 2>&1)

if echo $OUTPUT | grep -q 'Credentials'; then
    ACCESS_KEY=$(echo $OUTPUT | jq -r '.Credentials.AccessKeyId')
    SECRET_KEY=$(echo $OUTPUT | jq -r '.Credentials.SecretAccessKey')
    SESSION_TOKEN=$(echo $OUTPUT | jq -r '.Credentials.SessionToken')

    # Встановлюємо нові змінні середовища
    export AWS_ACCESS_KEY_ID=$ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=$SECRET_KEY
    export AWS_SESSION_TOKEN=$SESSION_TOKEN

    echo "Session established successfully!"
    # Додаткова перевірка встановленої сесії
    aws sts get-caller-identity
else
    echo "Credentials could not be retrieved. Please check your MFA code and try again."
    echo "Error:"
    echo $OUTPUT
fi
