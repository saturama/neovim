#!/bin/bash

set -e

echo "Настройка Python окружения..."

# Настройки
VENV_DIR="$HOME/.python"
SKIP_DEPS=false
FORCE_RECREATE=false

# Парсим аргументы
while [[ $# -gt 0 ]]; do
    case $1 in
        --skip-deps)
            SKIP_DEPS=true
            shift
            ;;
        --recreate-venv)
            FORCE_RECREATE=true
            shift
            ;;
        *)
            echo "Неизвестный параметр: $1"
            exit 1
            ;;
    esac
done

# Устанавливаем python если нет
if ! command -v python >/dev/null 2>&1; then
    echo "Устанавливаем python..."
    pkg install -y python
fi

echo "Версия Python: $(python --version 2>&1)"

# Принудительное пересоздание venv
if [ "$FORCE_RECREATE" = true ] && [ -d "$VENV_DIR" ]; then
    echo "Пересоздаем виртуальное окружение..."
    rm -rf "$VENV_DIR"
fi

# Создаем виртуальное окружение
if [ ! -d "$VENV_DIR" ]; then
    echo "Создаем виртуальное окружение в $VENV_DIR..."
    python -m venv "$VENV_DIR"
    echo "Виртуальное окружение создано"
fi

# Обновляем pip
echo "Обновляем pip..."
"$VENV_DIR/bin/pip" install --upgrade pip

# Определяем файл конфигурации оболочки
if [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
else
    SHELL_CONFIG="$HOME/.profile"
fi

# Добавляем в PATH если еще не добавлено
if ! grep -q "export PATH=\"$VENV_DIR/bin:" "$SHELL_CONFIG" && ! grep -q "export PATH=$VENV_DIR/bin:" "$SHELL_CONFIG"; then
    echo "export PATH=\"$VENV_DIR/bin:\$PATH\"" >> "$SHELL_CONFIG"
    echo "Добавлен PATH в $SHELL_CONFIG"
fi

# Устанавливаем зависимости если требуется
if [ "$SKIP_DEPS" = false ] && [ -f "./requirements.txt" ]; then
    echo "Устанавливаем зависимости..."
    "$VENV_DIR/bin/pip" install -r ./requirements.txt
    echo "Зависимости установлены!"
elif [ "$SKIP_DEPS" = false ]; then
    echo "requirements.txt не найден, пропускаем установку зависимостей"
fi

echo "Готово!"
echo "Для активации окружения выполните: source $VENV_DIR/bin/activate"
echo "Или просто перезапустите терминал"
