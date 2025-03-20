
# 🚀 GitFlow Lite – Guía de Uso

Este repositorio utiliza una estructura simplificada basada en el modelo **GitFlow**, gestionado mediante scripts personalizados (`gitflow-lite.bat` para Windows y `gitflow-lite.sh` para Linux/Mac/Git Bash), sin necesidad de instalar GitFlow como herramienta adicional.

---

## 📂 Estructura de ramas

| Rama        | Propósito                                  |
|-------------|---------------------------------------------|
| `main`      | Código en producción (versiones estables)   |
| `develop`   | Línea base de desarrollo                    |
| `release/*` | Preparación de nuevas versiones             |
| `hotfix/*`  | Corrección urgente sobre producción         |

---

## ⚙ Uso de scripts GitFlow Lite

### ✅ Iniciar una nueva **release**
```bash
gitflow-lite.bat release start v1.0.0        (en Windows)
./gitflow-lite.sh release start v1.0.0       (en Linux/macOS)
```
Esto:
- Cambia a la rama `develop`
- Crea una nueva rama `release/v1.0.0`

### ✅ Finalizar una **release**
```bash
gitflow-lite.bat release finish v1.0.0
./gitflow-lite.sh release finish v1.0.0
```
Esto:
- Fusiona `release/v1.0.0` en `main` y `develop`
- Crea un tag `v1.0.0`
- Elimina la rama `release/v1.0.0` local y remota

### 🔧 Iniciar un **hotfix**
```bash
gitflow-lite.bat hotfix start v1.0.1
./gitflow-lite.sh hotfix start v1.0.1
```
Esto:
- Cambia a la rama `main`
- Crea una nueva rama `hotfix/v1.0.1`

### 🔧 Finalizar un **hotfix**
```bash
gitflow-lite.bat hotfix finish v1.0.1
./gitflow-lite.sh hotfix finish v1.0.1
```
Esto:
- Fusiona `hotfix/v1.0.1` en `main` y `develop`
- Crea un tag `v1.0.1`
- Elimina la rama `hotfix/v1.0.1` local y remota

---

## 📌 Requisitos

- Tener Git instalado y configurado.
- Scripts `gitflow-lite.bat` o `gitflow-lite.sh` deben estar ubicados en la raíz del proyecto o accesibles por consola.

---

## 💡 Notas

- Este flujo es compatible con cualquier CI/CD que trabaje con ramas estándar de GitFlow.
- Se puede complementar con herramientas como **GitVersion** para versionado automático.

---

## 🙌 Créditos

Inspirado en el modelo original de GitFlow por [nvie](https://nvie.com/posts/a-successful-git-branching-model/), adaptado a scripts simples para facilitar su uso sin dependencias externas.
