#pragma once

#include <QObject>
#include <QAbstractTableModel>
#include <vector>

class QMLTableModel : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit QMLTableModel(QObject *parent = nullptr);
    struct RowElement{
        int id;
        QString name;
        QString surname;
        QStringList friends;
    };
    enum QMLTableModelRoles {
        IdRole = Qt::UserRole + 1,
        NameRole,
        SurnameRole,
        FriendsRole
    };
    int rowCount(const QModelIndex& /*index*/) const override;
    int columnCount(const QModelIndex& index) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    void appendRowElement(const RowElement& element);
private:
    std::vector<RowElement> m_data;
};

